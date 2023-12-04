import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="recommendations"
export default class extends Controller {

  static targets = ["activityIds", "restaurantIds"]

  connect() {
    console.log("Hello, Stimulus!", this.element)
  }

  selectActivity(event) {
    event.currentTarget.classList.toggle("border");
    event.currentTarget.classList.toggle("border-primary");
    this.activityIdsTarget.value = this.activityIdsTarget.value + event.currentTarget.dataset.id + ",";
    console.log("Array:",this.activityIdsTarget.value);
  }

  selectRestaurant(event) {
    event.currentTarget.classList.toggle("border");
    event.currentTarget.classList.toggle("border-primary");
    this.restaurantIdsTarget.value = this.restaurantIdsTarget.value + event.currentTarget.dataset.id + ",";
    console.log("Array:",this.restaurantIdsTarget.value);
  }
}
