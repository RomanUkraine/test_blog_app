import { Controller } from "@hotwired/stimulus";

function onlySpaces(str) {
  return str.trim().length === 0;
}

export default class extends Controller {
  static targets = ["title", "body", "titleCount", "bodyCount"];

  connect(){
    document.getElementsByName("commit")[0].setAttribute("disabled", true);
  }

  updateCount() {
    // do not consider more than 1 whitespace as a character
    // title and body are stipped before save and whitespace gets removed
    let titleChars = this.titleTarget.value.trim().length;
    let bodyChars = this.bodyTarget.value.trim().length;

    this.titleCountTarget.textContent = `${titleChars}/50`; // TODO: should be a constant (in model?)
    this.bodyCountTarget.textContent = `${bodyChars}/140`;  // TODO: should be a constant (in model?)

    // if title or body contains only whitespace or has 0 chars
    if (onlySpaces(this.titleTarget.value) || onlySpaces(this.bodyTarget.value) || titleChars == 0 || bodyChars == 0) {
      // disable create button
      document.getElementsByName("commit")[0].setAttribute("disabled", true);
    } else if (titleChars > 50) {
      // disable create button and make counter red
      this.titleCountTarget.classList.remove("text-gray-400");
      this.titleCountTarget.classList.add("text-orange-600");
      document.getElementsByName("commit")[0].setAttribute("disabled", true);
    } else if (bodyChars > 140) {
      // disable create button and make counter red
      this.bodyCountTarget.classList.remove("text-gray-400");
      this.bodyCountTarget.classList.add("text-orange-600");
      document.getElementsByName("commit")[0].setAttribute("disabled", true);
    } else {
      // enable create button and make counter normal
      this.titleCountTarget.classList.remove("text-orange-600");
      this.titleCountTarget.classList.add("text-gray-400");
      document.getElementsByName("commit")[0].removeAttribute("disabled");
    }
  }
}
