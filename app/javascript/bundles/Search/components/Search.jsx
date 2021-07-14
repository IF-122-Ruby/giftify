import React, { Component } from "react";
import axios from "axios";
import Select from "react-select";

export default class Search extends Component {  
  state = {
    options: [{value: '', label: ''}], 
    value: '',
  }

  getCompleteResults(text) {
    axios.get('/api/v1/search.json', {
      params: {
        search: text
      }
    }).then(response => {
      const options = response.data.results.map((item) => ({
        value: item.result.id,
        label: item.result.name || `${item.result.first_name} ${item.result.last_name}`,
        url: item.result.url
      }))

      this.setState({options});
    }).catch(response => console.log(response));
  }

  onChangeValue = (text) => {
    this.getCompleteResults(text);  
    this.setState({ value: text });  
  }

  onSelect = (option) => {
    window.open(`${option.url}/${option.value}`, '_self');
  }

  render() {
    return(
      <div>
        <form onSubmit={()=>submit()}>
          <Select
            inputValue={this.state.value}
            onInputChange={this.onChangeValue}
            options={this.state.options}
            onChange={this.onSelect}
            ignoreCase
            isClearable
            isSearchable
          />
          <input type="submit" />
        </form>
      </div>
    );
  }
}


