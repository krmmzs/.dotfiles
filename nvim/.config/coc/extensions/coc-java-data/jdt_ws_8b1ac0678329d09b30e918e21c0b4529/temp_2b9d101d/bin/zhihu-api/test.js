let zhihu = require('zhihu');

let username = 'shanejs';

zhihu.User.info(username).then(function(user){
  console.log(user);
});
