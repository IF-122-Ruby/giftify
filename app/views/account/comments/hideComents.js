function hideComents(elementID) { 
  var x = document.getElementById(elementID);
  if (x.style.display === 'none') {
      x.style.display = 'block';
  } else {
      x.style.display = 'none';
  }
}