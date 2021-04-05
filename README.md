# README

This README provides instructions on how to use the BetterUp coach appointments app.

Installation:

  1. Clone the github repository WilliamJones62/BetterUp.
  2. Bundle install.
  3. rails db:migrate. The code was tested using a sqlite3 database.
  4. Create a file called 'data.csv' in the better_up folder and copy the coaches available hours data into it.
  5. rails s (to start the server)
  6. In the browser enter the address 'localhost:3000/coaches_csv/csv'
  7. Choose the data.csv file and press import. This will create the coaches 30 minute appointment records in the table
  coach_appointments.

User Guide:

  1. In the browser enter the address 'localhost:3000'
  2. The initial coach appointment page is displayed.
  3. The client must enter a name in order to see the available appointments, which will also include appointments they have previously selected (highlighted in aquamarine).
  4. The client can select a time zone to see the appointment times displayed for that time zone. Selections are limited to those of the continental USA and Alaska.
  5. The client can also select a specific coach and only see available appointments for that coach.
  6. If the client wishes to cancel an appointment they simply click on the appointment time. The appointment is then available to all clients for selection.

  Future Developments:

  1. Expand the time zone selection to all appropriate time zones.
  2. Allow multiple coaches to be selected instead of just one.
  3. Allow the client to filter the appointments by day and hour range so they only see appointments that are relevant.
  4. Improve the styling of the page (I ran out of time) to make it more attractive.
  5. Provide summary information about the appointments the client has made (total number, with whom, when)

Environment:

* Ruby version 2.7.2

* Rails version 6.1.3.1
