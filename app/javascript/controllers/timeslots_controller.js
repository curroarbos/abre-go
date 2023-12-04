import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="timeslots"
export default class extends Controller {

  static values = {

  }

  connect() {
    console.log("Hello from the datechange controller")
  }

  dateChange(event) {
    
    console.log(event);
    console.log(event.currentTarget._flatpickr.selectedDates[0]);
  }
}
