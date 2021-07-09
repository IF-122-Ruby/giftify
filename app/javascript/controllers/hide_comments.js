// function hideComments(elementID) { 
//   let hidden_comments = document.getElementById(elementID);
//   if (hidden_comments.style.display === 'none') {
//       hidden_comments.style.display = 'block';
//   } else {
//     hidden_comments.style.display = 'none';
//   }
//  }

function hideComments(elementID){
  let hidden_comments = document.getElementById(elementID);
  if (hidden_comments.classList.contains('d-none')) {
      hidden_comments.classList.remove('d-none')
      hidden_comments.classList.add('d-block')
  }
  else {
    hidden_comments.classList.remove('d-block')
    hidden_comments.classList.add('d-none')
  }
}

function hideComments(elementID){
  let hidden_comments = document.getElementById(elementID);
    hidden_comments.classList.toggle('d-none')
}

window.hideComments = hideComments;