import { Controller } from "@hotwired/stimulus";

// Connects to data-controller="modal"
export default class ModalController extends Controller {
  static targets = ["modal"];
  connect() {
    console.log("Modal controller connected");
  }

  open() {
    this.modalTarget.classList.remove("hidden");
    document.body.classList.add("overflow-hidden");
    console.log("Opening modal...");
  }

  close() {
    this.modalTarget.classList.add("hidden");
    document.body.classList.remove("overflow-hidden");
    console.log("Closing modal...");
  }

  outsideClick(event) {
    if (event.target === this.modalTarget) {
      this.close();
    }
  }
}
