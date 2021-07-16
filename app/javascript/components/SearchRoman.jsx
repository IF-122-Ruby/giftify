import React, { Component } from 'react';
import axios from 'axios';
import AsyncSelect from 'react-select/async';

class SearchRoman extends Component {
  state = { results: [] };

  getLabel(i) {
    switch(i.type) {
      case 'user':
        return `${i.first_name} ${i.last_name}`
      case 'gift':
        return i.name
      default:
        break;
    }
    i.name || `${i.first_name} ${i.last_name}`
  }

  loadOptions = async (inputText, callback) => {
    const response = await axios.get("/api/v1/search", {
      params: {
        query: inputText
      }
    });
    const res_data =  await response.data;
    const results = res_data.map((i) => ({label: this.getLabel(i) + (" ") + i.type , value: i.id, link: i.link }));
    callback(results)
  }

  onSubmit(e) {
    this.setState({isSubmitted: true})
  }

  onChange = (result, inputText) => {
    this.setState({
    results: inputText || result
    })
    window.location.href = result.link;

  }
  render() {
    const { results } = this.state;
    return (
    <div className='results col-8'>
      <a id='link' onSubmit={this.onSubmit.bind(this)}></a>
        <form >
        <button type="submit" value="Submit" className = "btn btn-primary m-2">
              <i className="fas fa-search"></i>
            </button>
            <div className="form">
            <AsyncSelect
                cacheOptions
                value={(this.state.result)}
                onChange={this.onChange}
                placeholder={'Try search...'}
                loadOptions={this.loadOptions}
            />
            </div>          
        </form>
      {this.state.isSubmitted && <SearchResultList results={(this.state.results)} /> }
    </div>   
    )
  }
}
export default SearchRoman
