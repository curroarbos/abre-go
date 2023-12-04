import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timeslots"
export default class extends Controller {

  static targets = ["slots"]

  static values = {
    id: Number
  }

  connect() {
    console.log("Hello from the datechange controller")
  }

  dateChange(event) {
    console.log(this.slotsTarget);
    const url = `http://localhost:3000/api/v1/time_slots?date=${encodeURI(event.currentTarget._flatpickr.selectedDates[0])}&activity_id=${this.idValue}`
    fetch(url, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.slotsTarget.innerHTML = `<fieldset class="mb-3 radio_buttons optional booking_time_slot"><legend class="col-form-label pt-0">Time slot</legend><input type="hidden" name="booking[time_slot_id]" value="" autocomplete="off"></fieldset>`
        JSON.parse(data).forEach(slot => {
          console.log(slot);
          const timestampStart = Date.parse(slot.start_time);
          const dateStart = new Date(timestampStart);

          const hoursStart = String(dateStart.getHours()).padStart(2, '0'); // Ensures 2 digits with leading zero if needed
          const minutesStart = String(dateStart.getMinutes()).padStart(2, '0'); // Ensures 2 digits with leading zero if needed

          const formattedTimeStart = `${hoursStart}:${minutesStart}`;

          const timestampEnd = Date.parse(slot.end_time); // Assuming slot.end_time is the variable containing the end time

          const dateEnd = new Date(timestampEnd);

          const hoursEnd = String(dateEnd.getHours()).padStart(2, '0'); // Ensures 2 digits with leading zero if needed
          const minutesEnd = String(dateEnd.getMinutes()).padStart(2, '0'); // Ensures 2 digits with leading zero if needed

          const formattedTimeEnd = `${hoursEnd}:${minutesEnd}`;


          this.slotsTarget.firstChild.insertAdjacentHTML("beforeend", `<div class="form-check"><input class="form-check-input radio_buttons optional" type="radio" value="${slot.id}" name="booking[time_slot_id]" id="booking_time_slot_id_${slot.id}"><label class="form-check-label collection_radio_buttons" for="booking_time_slot_id_99">${formattedTimeStart}-${formattedTimeEnd}</label></div>`)
        });
      })
  }
}
