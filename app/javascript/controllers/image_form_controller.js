import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = [
    "imageUploader",
    "previewSection",
    "imagePreview",
    "clearUpload"
  ];

  connect() {
    this.updatePreview();
  }

  updatePreview() {
    this.imageUploaderTarget.files.length
      ? this.showPreview()
      : this.hidePreview();
  }

  showPreview() {
    this.imagePreviewTarget.src = URL.createObjectURL(
      this.imageUploaderTarget.files[0]
    );
    this.previewSectionTarget.classList.remove("d-none");
  }

  hidePreview() {
    this.previewSectionTarget.classList.add("d-none");
  }

  clearUpload() {
    this.imageUploaderTarget.value = null;
    this.updatePreview();
  }

}
