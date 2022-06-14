import { Controller } from "@hotwired/stimulus";

const maxChars = 400;

function onlySpaces(str) {
  return str.trim().length === 0;
}

export default class extends Controller {
  static targets = ["input", "inputCount", "form"];

  connect() {
      this.inputTarget.style.resize = 'none';
      this.inputTarget.style.minHeight = `${this.inputTarget.scrollHeight}px`;
      // prevent the scrollbar from appearing when adding text
      this.inputTarget.style.overflow = 'hidden';
  }

  resize(event){
      event.target.style.height = '5px';
      event.target.style.height =  `${event.target.scrollHeight}px`;
  }

  updateCount() {
    let chars = this.inputTarget.value.trim().length;
    this.inputCountTarget.textContent = `${chars}/${maxChars}`;
  }

  submitWithEnter(event) {
    let chars = this.inputTarget.value.trim().length;

    // if comment contains only whitespace or has 0 chars
    if (!onlySpaces(this.inputTarget.value) || chars !== 0) {
      if (event.keyCode == 13 && !event.shiftKey) {
        event.preventDefault();
        this.formTarget.requestSubmit();
      }
    }
  }
}
