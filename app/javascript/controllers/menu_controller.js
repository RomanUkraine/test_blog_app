import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from "stimulus-use";

export default class extends Controller {
  static targets = ['toggleable'];

  connect() {
    useClickOutside(this);
  }

  clickOutside() {
    this.toggleableTarget.classList.add('hidden');
  }

  toggle() {
    this.toggleableTarget.classList.toggle('hidden');
  }
}
