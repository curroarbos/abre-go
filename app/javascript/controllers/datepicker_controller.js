import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {

  static values = {
    disabledDates: Array
  }

  connect() {
    // console.log(this.disabledDatesValue)
    flatpickr(this.element, {
      dateFormat: "F j, Y",
      minDate: "today",
      locale: {
        firstDayOfWeek: 1
      }
  })
  }
}
