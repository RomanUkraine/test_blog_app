import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["input"];

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
}
