import { Controller } from "@hotwired/stimulus";

export default class Menu extends Controller {
  static targets = ['toggleable'];

  toggle() {
    this.toggleableTarget.classList.toggle('hidden');
  }

  closeMenu() {
    this.toggleableTarget.classList.add('hidden');
  }
}
