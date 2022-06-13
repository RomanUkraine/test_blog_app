import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["commentInput"];

  connect() {
      this.commentInputTarget.style.resize = 'none';
      this.commentInputTarget.style.minHeight = `${this.commentInputTarget.scrollHeight}px`;
      // prevent the scrollbar from appearing when adding text
      this.commentInputTarget.style.overflow = 'hidden';
  }

  resize(event){
      event.target.style.height = '5px';
      event.target.style.height =  `${event.target.scrollHeight}px`;
  }
}
