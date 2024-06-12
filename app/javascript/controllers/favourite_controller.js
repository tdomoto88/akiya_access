import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static targets = ['link', 'icon'];
  static values = {
    propertyId: Number,
    userId: Number
  }

  connect() {
    console.log('favourite connected...');
  }

  send(event) {
    event.preventDefault();
    console.log(this.linkTarget);
    console.log(this.propertyIdValue);
    console.log(this.iconTarget);

    fetch(`/properties/${this.propertyIdValue}/favourite?user_id=${this.userIdValue}`, {
      method: "GET",
    });


  }
}
