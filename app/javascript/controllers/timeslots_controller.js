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
    const urlProd = `https://abre-go.osc-fr1.scalingo.io/api/v1/time_slots?date=${encodeURI(event.currentTarget._flatpickr.selectedDates[0])}&activity_id=${this.idValue}`
    const urlDev = `http://localhost:3000/api/v1/time_slots?date=${encodeURI(event.currentTarget._flatpickr.selectedDates[0])}&activity_id=${this.idValue}`
    console.log(urlProd);
    fetch(urlProd, { headers: { "Accept": "text/plain" } })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        this.slotsTarget.innerHTML = `<fieldset class="mb-3 radio_buttons optional booking_time_slot"><legend class="col-form-label pt-0">Time slot</legend><input type="hidden" name="booking[time_slot_id]" value="" autocomplete="off"></fieldset>`
        JSON.parse(data).forEach(slot => {
          const startTime = new Date(slot.start_time);
          const endTime = new Date(slot.end_time);

          const options = {
            hour12: false, // Use 24-hour format
            hour: '2-digit',
            minute: '2-digit',
            timeZone: 'UTC' // Set the time zone to UTC to display the original time
          };

          const formattedStartTime = startTime.toLocaleTimeString('en-US', options);
          const formattedEndTime = endTime.toLocaleTimeString('en-US', options);

          this.slotsTarget.firstChild.insertAdjacentHTML("beforeend", `<div class="form-check"><input class="form-check-input radio_buttons optional" type="radio" value="${slot.id}" name="booking[time_slot_id]" id="booking_time_slot_id_${slot.id}"><label class="form-check-label collection_radio_buttons" for="booking_time_slot_id_99">${formattedStartTime}-${formattedEndTime}</label></div>`)
        });
      })
  }
}
