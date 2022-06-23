import { Controller } from "@hotwired/stimulus";

const titleMaxChars = 50;
const bodyMaxChars = 300;

function onlySpaces(str) {
  return str.trim().length === 0;
}

export default class extends Controller {
  static targets = ["title", "body", "titleCount", "bodyCount", "newPostModal"];

  connect(){
    document.getElementsByName("commit")[0].setAttribute("disabled", true);
  }

  initialize() {
    this.newPostModalTarget.classList.add('hidden');
  }

  afterSubmit() {
    this.newPostModalTarget.reset();
    this.close();
  }

  open() {
    this.newPostModalTarget.classList.remove('hidden');
  }

  // TODO: add outside modal click
  close(e) {
    e.preventDefault();
    this.newPostModalTarget.classList.add('hidden');
  }

  updateCount() {
    // do not consider more than 1 whitespace as a character
    // title and body are stipped before save and whitespace gets removed
    let titleChars = this.titleTarget.value.trim().length;
    let bodyChars = this.bodyTarget.value.trim().length;

    this.titleCountTarget.textContent = `${titleChars}/${titleMaxChars}`;
    this.bodyCountTarget.textContent = `${bodyChars}/${bodyMaxChars}`;

    // if title or body contains only whitespace or has 0 chars
    if (onlySpaces(this.titleTarget.value) || onlySpaces(this.bodyTarget.value) || titleChars == 0 || bodyChars == 0) {
      // disable create button
      document.getElementsByName("commit")[0].setAttribute("disabled", true);
    } else {
      document.getElementsByName("commit")[0].removeAttribute("disabled");
    }
  }
}
