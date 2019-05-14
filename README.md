# README

## Getting Started
### Loading the Application
In order to get the application running, clone down the repository into your chosen folder. Once it's cloned down, use these commands to get the database up and running.
```Shell
bundle install

rails db:create

rails db:migrate

rails db:seed
```

### API Calls
In order to make API calls, every call besides the first authentication/login call will need an authorization token. This token should be sent in the headers of the call, with the format { ACCESS_TOKEN: "[token]" }. This will allow the calls to get through the authorization code.

For the first authentication call, the only thing needed is the `email` and `password` of a valid user. This user must exist and also be active. The `email` and `password` should be sent in the params of the request, most likely using formData. If using formData and Axios, an example call would look like this
```JavaScript
    const formData = {
      'email': this.state.username,
      'password': this.state.password
    }
    const header_info = {
      'Content-Type': 'application/json',
      'Access-Control-Allow-Origin': '*'
    };
    await axios.post(`${apiUrl}/api/v1/authenticate`, formData, {headers: header_info}).then((response) => {})
```
