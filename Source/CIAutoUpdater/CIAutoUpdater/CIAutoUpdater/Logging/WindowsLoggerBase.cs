using System;
using System.Configuration;
using System.Diagnostics;
using System.IO;
using System.Reflection;
using System.Text;

namespace CIAutoUpdater.Logging
{
    public abstract class WindowsLoggerBase : LoggerBase
    {
        protected WindowsLoggerBase()
        {
            //If Debug is enabled it will log stack traces including source info.
            DebugEnabled = Convert.ToBoolean(ConfigurationManager.AppSettings["LogDebugEnabled"] ?? "false");

            Assembly asm = Assembly.GetExecutingAssembly();
            _currentAssemblyNamespace = asm.FullName.Substring(0, asm.FullName.IndexOf(","));
        }

        private readonly string _currentAssemblyNamespace;

        protected override string GetStackTrace()
        {
            var stackLog = new StringBuilder();
            var currentStack = new StackTrace(DebugEnabled); // the true value is used to include source file info

            bool started = false;
            for (Int32 x = 2; x < currentStack.FrameCount; ++x)
            {
                var methodCall = currentStack.GetFrame(x);
                if (!started)
                    started = IsMethodToBeIncluded(methodCall);

                if (started)
                {
                    stackLog.AppendLine(MethodCallLog(methodCall));
                }
            }
            return stackLog.ToString();
        }

        // This method is used to keep Logger methods out of the returned log
        // (the methods actually included in a StackTrace depend on compiler optimizations).
        private bool IsMethodToBeIncluded(StackFrame stackMethod)
        {
            MethodBase method = stackMethod.GetMethod();

            if (method == null || method.DeclaringType == null || string.IsNullOrEmpty(method.DeclaringType.FullName))
                return false;

            if (method.DeclaringType.FullName.StartsWith(_currentAssemblyNamespace, StringComparison.OrdinalIgnoreCase))
                return false;
            
            return true;
        }

        // Instead of visiting each field of stackFrame, the StackFrame.ToString() method could be used, 
        // but the returned text would not include the class name.
        private static String MethodCallLog(StackFrame methodCall)
        {
            MethodBase method = methodCall.GetMethod();
            ParameterInfo[] methodParameters = method.GetParameters();

            var parameters = string.Empty;
            foreach (var parameter in methodParameters)
            {
                if (!string.IsNullOrEmpty(parameters))
                    parameters += ", ";
                parameters += string.Format("{0} {1}", parameter.ParameterType.Name, parameter.Name);
            }

            var result = string.Format("{0}.{1}({2})", method.DeclaringType, methodCall.GetMethod().Name, parameters);

            var sourceFileName = methodCall.GetFileName();
            if (!string.IsNullOrEmpty(sourceFileName))
            {
                result += string.Format(" in {0}: line {1}", sourceFileName, methodCall.GetFileLineNumber());
            }

            return result;
        }
    }
}