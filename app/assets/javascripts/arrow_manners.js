// //Xroot direct relation
// document.addEventListener('turbolinks:load', function() {
//   var controls = document.querySelectorAll('.xroot-direct-relation-link')

//   if (controls.length) {
//     for (var i = 0; i < controls.length; i++) {
//       controls[i].addEventListener('click', fetchInlineLinkHandler)
//     }
//   }
// })

// function fetchInlineLinkHandler(event) {
//   var xrootId = this.dataset.xrootId
//   fetchInlineHandler(xrootId)
// }

// function fetchInlineHandler(xrootId) {
//   var arrow = document.querySelector('.arrow-xroot[data-xroot-id="' + xrootId + '"]')

//   if (arrow) {
//     if (arrow.classList.contains('text-secondary')) {
//       arrow.classList.remove('text-secondary')
//     } else {
//       arrow.classList.add('text-secondary')
//     }
//   }
// }

// //Xcategory direct relation
// document.addEventListener('turbolinks:load', function() {
//   var controls = document.querySelectorAll('.xcategory-direct-relation-link')

//   if (controls.length) {
//     for (var i = 0; i < controls.length; i++) {
//       controls[i].addEventListener('click', fetchInlineLinkHandler)
//     }
//   }
// })

// function fetchInlineLinkHandler(event) {
//   var xcategoryId = this.dataset.xcategoryId
//   fetchInlineHandler(xcategoryId)
// }

// function fetchInlineHandler(xcategoryId) {
//   var arrow = document.querySelector('.arrow-xcategory[data-xcategory-id="' + xcategoryId + '"]')

//   if (arrow) {
//     if (arrow.classList.contains('text-secondary')) {
//       arrow.classList.remove('text-secondary')
//     } else {
//       arrow.classList.add('text-secondary')
//     }
//   }
// }