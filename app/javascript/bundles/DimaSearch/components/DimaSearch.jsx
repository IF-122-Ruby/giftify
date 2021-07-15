import React, { useEffect, useState } from 'react';

const DimaSearch = () => {

  const [searchObject, setSearchObject] = useState("")
  
  useEffect(() => {
    fetch(
      `/api/v1/search_objects?search=${searchObject}`
    )
      .then((response) => response.json())
      .then((data) => {
        console.log(data);
      });
  }, [searchObject]);

  const handleOnChange = (event) => {
    event.preventDefault()
    setSearchObject(event.target.value)
  }

  return (
    <div className="container justify-content-center">
      <div className="row">
        <div className="col-md-8">
            <div className="input-group mb-3">
              <input 
              type="text" 
              className="form-control input-text"
              placeholder="Search..."
              onChange={(event) => handleOnChange(event)}
              />
            <div className="input-group-append">
              <button className="btn btn-outline-primary btn-lg" type="button">
                <i className="fa fa-search"></i>
              </button>
            </div>
            </div>
        </div>
      </div>
    </div>
  )
}

export default DimaSearch


