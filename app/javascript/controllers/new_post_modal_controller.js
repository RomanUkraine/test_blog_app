import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['newPostModal'];

  // // TODO: make it work
  // clickOutside(e) {
  //   e.preventDefault();
  //   this.newPostModalTarget.classList.add('hidden');
  // }

  open() {
    this.newPostModalTarget.classList.remove('hidden');
  }
}
