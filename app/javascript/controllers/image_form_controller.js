import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["imageUploader", "previewSection", "imagePreview", "clearUpload"];

  connect() {
    this.updatePreview();
  }

  updatePreview() {
    this.imageUploaderTarget.files.length || this.imagePreviewTarget.src !== '#'
      ? this.showPreview()
      : this.hidePreview();
  }

  showPreview() {
    this.imagePreviewTarget.src = URL.createObjectURL(
      this.imageUploaderTarget.files[0]
    );
    this.previewSectionTarget.classList.remove("hidden");
  }

  hidePreview() {
    this.previewSectionTarget.classList.add("hidden");
  }

  clearUpload(e) {
    e.preventDefault()
    this.imageUploaderTarget.value = null;
    this.hidePreview();
  }

}
