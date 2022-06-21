import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['newPostModal'];

  open() {
    this.newPostModalTarget.classList.remove('hidden');
  }

  // TODO: add outside modal click
  close(e) {
    console.log(e)
    e.preventDefault();
    this.newPostModalTarget.classList.add('hidden');
  }
}
