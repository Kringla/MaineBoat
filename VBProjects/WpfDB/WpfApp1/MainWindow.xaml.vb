Class MainWindow
    Dim conn As New PMSDataAccess.PMSDataAccess.PMSConnection()

    Private Sub Button_Click(sender As Object, e As RoutedEventArgs) Handles button.Click

        Dim docs = conn.Dokumenters.ToList()

        MessageBox.Show("Antall docs=" & docs.Count)

        Dim doc = conn.Dokumenters.First()

        MessageBox.Show("DokTittel=" & doc.DokTittel)

    End Sub

    Private Sub Button1_Click(sender As Object, e As RoutedEventArgs) Handles button1.Click

        Dim jobsWithId = From jobb In conn.Jobbs
                         Where jobb.UtstyrID = 2074
                         Select jobb

        Dim firstJob = jobsWithId.FirstOrDefault

        Dim msg = "Antall docs=" & jobsWithId.Count & " Første JobbNavn=" & firstJob.JobbNavn

        MessageBox.Show(msg)
    End Sub
End Class
