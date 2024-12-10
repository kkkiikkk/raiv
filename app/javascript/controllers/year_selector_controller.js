import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["dropdown"];

  connect() {
    this.isOpen = false;
    this.dropdownTarget.classList.add("hidden");
  }

  toggle() {
    this.isOpen = !this.isOpen;
    if (this.isOpen) {
      this.dropdownTarget.classList.remove("hidden");
    } else {
      this.dropdownTarget.classList.add("hidden");
    }
  }

  select(event) {
    const selectedYear = event.currentTarget.dataset.yearSelectorYear;
    this.toggle();
    console.log(`Year selected: ${selectedYear}`);

    const params = new URLSearchParams(window.location.search);
    params.set("year", selectedYear);
    window.location.search = params.toString();
  }

  close(event) {
    if (!this.element.contains(event.target)) {
      this.isOpen = false;
      this.dropdownTarget.classList.add("hidden");
    }
  }
}
