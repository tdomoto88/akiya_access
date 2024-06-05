import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="clipboard"
export default class extends Controller {
  connect() {
  }
  copy() {
    navigator.clipboard.writeText(window.location.href)
  }
}
