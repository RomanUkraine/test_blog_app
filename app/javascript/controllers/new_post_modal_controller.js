import { Controller } from "@hotwired/stimulus";
import { useClickOutside } from "stimulus-use";

export default class extends Controller {
  static targets = ['newPostModal'];

  connect() {
    useClickOutside(this);
  }


  // TODO: make it work
  clickOutside(e) {
    e.preventDefault();
    this.newPostModalTarget.classList.add('hidden');
  }

  open() {
    this.newPostModalTarget.classList.remove('hidden');
  }
}
