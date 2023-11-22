import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {

  static values = {
    disabledDates: Array
  }

  connect() {
    // console.log(this.disabledDatesValue)
    flatpickr(this.element, {
      enableTime: true,
      dateFormat: "F j, Y - H:i",
      minDate: "today",
      disable: this.disabledDatesValue
  })
  }
}
