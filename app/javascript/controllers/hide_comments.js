function hideComments(elementID){
  let hidden_comments = document.getElementById(elementID);
    hidden_comments.classList.toggle('d-none')
}

window.hideComments = hideComments;