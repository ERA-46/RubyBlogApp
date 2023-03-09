import { Controller } from "@hotwired/stimulus";
import { createPopup } from "@picmo/popup-picker";
import { RichText } from "../classes/RichText";

// Connects to data-controller="emoji-picker"
export default class extends Controller {
  static targets = ["trixEditor", "pickerContainer"]

  connect() {
    console.log("Emoji picker connected");
    //console.log(this.trixEditorTarget);
    const buttonString = this.emojiButtonString();
    const emojiButton = this.emojiButtonTemplate(buttonString);
    let picker;
    let richText = new RichText(picker, emojiButton);

    picker = createPopup(
    {
      rootElement: this.pickerContainerTarget,
    },
    {
      //element to trigger popup
      triggerElement: emojiButton,
      //the element to position the picker relative to
      referenceElement: emojiButton,
      //specify how to popup the picker
      position: "bottom-start",
    });

    picker.addEventListener("emoji:select", (event) => {
      this.trixEditorTarget.editor.insertString(event.emoji);
    });

    richText.setPicker(picker);
  }

  emojiButtonTemplate(buttonString){
    const domParser = new DOMParser();
    const emojiButton = domParser
      .parseFromString(buttonString, "text/html")
      .querySelector("button");
    return emojiButton;
  }

  emojiButtonString(){
    const buttonString = '<button class="trix-button" id="emoji-picker" data-trix-action="popupPicker" tabindex="1" >😀</button>';
    return buttonString;
  }

}
