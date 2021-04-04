function updateAppointment(id) {
  var client_id = document.getElementById("client_id" + id);
  var appointment_client = client_id.innerHTML;
  appointment_client = appointment_client.trim();
  // If the client id is blank update the coach_appointment record
  // with the client name entered by the client and highlight the
  // appointment time. Otherwise remove the client name and unhighlight
  // the appointment time.
  var req = new XMLHttpRequest();
  const url = `/api/v1/coach_appointments/${id}`;
  var client = '';
  if (appointment_client.length == 0) {
    var e = document.getElementById("client");
    client = e.value;
  }
  var data = `{
    "coach_appointment":{
    "id": "${id}",
    "client": "${client}"
    }
  }`;
  req.open("PATCH", url);
  req.setRequestHeader("Accept", "application/json");
  req.setRequestHeader("Content-Type", "application/json");
  req.onreadystatechange = function () {
     if (req.readyState === 4) {
       // successfully updataed coach_appointment record with client
       // now update the screen
       client_id.innerHTML = client;
       var time = document.getElementById("time_id" + id);
       if (client.length == 0) {
         // turn highlight off
         time.style.backgroundColor = "white";
       }else {
         time.style.backgroundColor = "Aquamarine";
       }

     }};
  req.send(data);
}

function client() {
  // restrict appointments shown to those available and those for this client
  var e = document.getElementById("client");
  var client = e.value;
  var table = document.getElementById("normal_dt");
  var tbodyRowCount = table.tBodies[0].rows.length;
  tbodyRowCount += 1;
  for (i = 1; i < tbodyRowCount; i++) {
    var appointment_client = document.getElementById("client_id" + i.toString());
    var tr = document.getElementById("appointment_id" + i.toString());
    tr.style.visibility = "visible";
    if (client == '' || (appointment_client.innerHTML != '' && appointment_client.innerHTML != client)) {
      //* if the client on the row is empty or matches the entered client display the row, else hide
      tr.style.visibility = "collapse";
    }else if (appointment_client.innerHTML == client) {
      // this appointment belongs to this client
      var time = document.getElementById("time_id" + i.toString());
      time.style.backgroundColor = "Aquamarine";
    }
  }
}

function coaches() {
  // restrict appointments shown to selected coach
  var e = document.getElementById("name_coach_id");
  var selected_coach = e.value;
  var table = document.getElementById("normal_dt");
  var tbodyRowCount = table.tBodies[0].rows.length;
  tbodyRowCount += 1;
  for (i = 1; i < tbodyRowCount; i++) {
    var name = document.getElementById("name_id" + i.toString());
    var tr = document.getElementById("appointment_id" + i.toString());
    tr.style.visibility = "visible";
    if (name.innerHTML != selected_coach && selected_coach != '') {
      //* if the name on the row matches the selected coach display the row, else hide
      tr.style.visibility = "collapse";
    }
  }
}

function timezones() {
  // change appointment times to match client timezone
  var e = document.getElementById("timezone");
  var selected_timezone = e.value;
  var table = document.getElementById("normal_dt");
  var tbodyRowCount = table.tBodies[0].rows.length;
  tbodyRowCount += 1;
  for (i = 1; i < tbodyRowCount; i++) {
    var gmt_hour = document.getElementById("gmt_id" + i.toString());
    var time = document.getElementById("time_id" + i.toString());
    // set the default time zone adjustment to Pacific
    var hour_adjust = 8;
    switch (selected_timezone) {
      case 'eastern':
        hour_adjust = 5;
        break;
      case 'central':
        hour_adjust = 6;
        break;
      case 'mountain':
        hour_adjust = 7;
        break;
      case 'pacific':
        hour_adjust = 8;
        break;
      case 'alaska':
        hour_adjust = 9;
        break;
      default:
        hour_adjust = 8;
    }
    var start_hour = gmt_hour.innerHTML - hour_adjust;
    var start_am_pm = 'AM';
    if (start_hour > 11) {
      start_am_pm = 'PM'
      if (start_hour > 12) {
        start_hour -= 12
      }
    }
    var end_hour = gmt_hour.innerHTML - hour_adjust;
    var end_am_pm = 'AM';
    var pos = time.innerHTML.indexOf(":");
    var start_min = time.innerHTML.substr(pos + 1, 2);
    pos = time.innerHTML.lastIndexOf(":");
    var end_min = time.innerHTML.substr(pos + 1, 2);
    if (start_min == '30') {
      end_hour += 1;
    }
    if (end_hour > 11) {
      end_am_pm = 'PM';
      if (end_hour > 12) {
        end_hour -= 12;
      }
    }
    var formatted = start_hour.toString() + ':' + start_min + start_am_pm + ' - ' + end_hour.toString() + ':' + end_min + end_am_pm;
    time.innerHTML = formatted;
  }
}
