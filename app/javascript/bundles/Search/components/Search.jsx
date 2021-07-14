import React, { Component } from "react";
import axios from "axios";
import Select from "react-select";

export default class Search extends Component {  
  state = {
    options: [{value: 'l', label: 'asd'}], 
    value: '',
  }

  getCompleteResults(text) {
    axios.get('/api/v1/search', {
      params: {
        search: text
      }
    }
    ).then(response => {
      const res_data = response.data;

      const options = res_data.result.map(() => ({
        value: item.id,
        label: item.name || `${item.first_name} ${item.last_name}`
      }));

      this.setState({options});
    })
  }

  onChangeValue = (text) => {
    this.getCompleteResults(text);  
    this.setState({ value: text });  
  }

  onSelect = (option) => {
    const id = option.value;
    const link = document.querySelector('#link');
    link.href = option.link + option.value;
    link.click();
  }

  render() {
    return(
      <div>
        <a id='link'></a>
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

