import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recommendations"
export default class extends Controller {

  static targets = ["activity", "activityIds"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  select(event) {
    event.currentTarget.classList.toggle("border");
    event.currentTarget.classList.toggle("border-primary");
    this.activityIdsTarget.value = this.activityIdsTarget.value + event.currentTarget.dataset.id + ",";
    console.log("Array:",this.activityIdsTarget.value);
  }
}
