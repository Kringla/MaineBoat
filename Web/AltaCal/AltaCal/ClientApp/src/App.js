import React from 'react';
import { ArrCalendar } from './components/ArrCalendar';

export default class App extends React.Component {
  static displayName = App.name;

  render () {
      return (<ArrCalendar />);
  }
}
