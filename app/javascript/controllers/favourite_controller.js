import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="favourite"
export default class extends Controller {
  static targets = ['link', 'icon'];
  static values = {
    propertyId: Number
  }

  connect() {
    console.log('favourite connected...');
  }

  send(event) {
    event.preventDefault();
    console.log(this.linkTarget);
    console.log(this.propertyIdValue);
    console.log(this.iconTarget);


    const favourite = this.iconTarget.classList.contains("fa-solid")
    if (favourite) {
      fetch(`/favourites/${this.propertyIdValue}`, {
        method: "DELETE",
        headers: {"X-CSRF-Token": document.head.querySelector("meta[name=csrf-token]")?.content}
      });
      this.iconTarget.classList.remove("fa-solid")
      this.iconTarget.classList.add("fa-regular");
    } else {
      fetch(`/favourites/${this.propertyIdValue}`, {
        method: "POST",
        headers: {"X-CSRF-Token": document.head.querySelector("meta[name=csrf-token]")?.content}
      });
      this.iconTarget.classList.remove("fa-regular")
      this.iconTarget.classList.add("fa-solid");
    }
  }
}
