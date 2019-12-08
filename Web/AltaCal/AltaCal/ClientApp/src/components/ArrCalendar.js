import React from 'react';

import FullCalendar from '@fullcalendar/react'
import dayGridPlugin from '@fullcalendar/daygrid'

//import 'https://use.fontawesome.com/releases/v5.0.6/css/all.css'
import '@fullcalendar/core/main.css';
import '@fullcalendar/daygrid/main.css';
import '@fullcalendar/bootstrap/main.css';
import styles from './ArrCalendar.css';


export class ArrCalendar extends React.Component {
    static displayName = ArrCalendar.name;

    constructor(props) {
        super(props);
        this.state = { calendarItems: [], loading: true };
        
        fetch('api/CalendarData/GetArrangementer')
            .then(response => response.json())
            .then(data => {
                this.setState({ calendarItems: data, loading: false });
            });
    }

    renderCalandarControl(items) {
        let calendarEvents =
            items.map(calItem => {
                var startDate = new Date(calItem.datoFull); // will be in local time
                var endDate = new Date(calItem.datoSluttFull); // will be in local time

                console.log("item " + JSON.stringify(calItem));
                if (isNaN(startDate.valueOf())) { // valid?
                    alert('Invalid dato for ' + calItem.arrNavn +'. Må på dato-sykehuset.');
                }
                return {
                    title: calItem.arrNavn, date: startDate, end: endDate, allDay: false
                }
            });

        return (
            <FullCalendar className={styles.ArrCalendar}
                defaultView="dayGridMonth"
                plugins={[dayGridPlugin]}
                weekNumbers={true}
                locale='nb'
                forceEventDuration={true}
                themeSystem='bootstrap'
                events={calendarEvents}
            />
        )
    }

    //static renderCalendarTable(items) {
    //    return (
    //        <table className='table table-striped'>
    //            <thead>
    //                <tr>
    //                    <th>Navn</th>
    //                    <th>Sted</th>
    //                    <th>Start</th>
    //                    <th>Slutt</th>
    //                </tr>
    //            </thead>
    //            <tbody>
    //                {items.map(calItem =>
    //                    <tr key={calItem.arrId}>
    //                        <td>{calItem.arrNavn}</td>
    //                        <td>{calItem.sted}</td>
    //                        <td>{calItem.datoFullText}</td>
    //                        <td>{calItem.datoSluttFullText}</td>
    //                    </tr>
    //                )}
    //            </tbody>
    //        </table>
    //    );
    //}

    render() {
        let contents = this.state.loading
            ? <p><em>Loading...</em></p>
            : this.renderCalandarControl(this.state.calendarItems);

        return (
            <div className="arr_calendar">
                {contents}
            </div>
        );
    }
}
