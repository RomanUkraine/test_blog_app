import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from "stimulus-use";

export default class Menu extends Controller {
  static targets = ['toggleable'];

  connect() {
    useClickOutside(this);
  }

  clickOutside(event) {
    // event.preventDefault();
    this.toggleableTarget.classList.add('hidden');
  }

  toggle() {
    this.toggleableTarget.classList.toggle('hidden');
  }
}
