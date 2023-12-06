import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="autocomplete-restaurant"
export default class extends Controller {
  static values = {
    key: String,
    propertyid: Number
  }

  static targets = ["list", "search"]

  connect() {
  }

  find(event) {
    event.preventDefault();
    const url = `https://local-business-data.p.rapidapi.com/autocomplete?query=${this.searchTarget.value}&region=eu&language=en`;
    const options = {
      method: 'GET',
      headers: {
        'X-RapidAPI-Key': this.keyValue,
        'X-RapidAPI-Host': 'local-business-data.p.rapidapi.com'
      }
    };

    fetch(url, options)
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        console.log(this.propertyidValue);
        this.listTarget.innerHTML = "";
        const places = data.data.filter((placeItem) => {
          return placeItem.type === "place"
        })
        if (places.length === 0) {
          this.listTarget.insertAdjacentHTML("beforeend", "<p>No results were found. Please, try again</p>")
        } else
          data.data.forEach(restaurant => {
            if (restaurant.type === "place") {
              this.listTarget.insertAdjacentHTML("beforeend",
              `<li class="list-group-item"><a data-turbo-method="post" href="/properties/${this.propertyidValue}/restaurants?place_id=${restaurant.place_id}">${restaurant.main_text} - ${restaurant.secondary_text}</a></li>`);
            }
          });
      }).catch(error => console.log(error))
  }
}
