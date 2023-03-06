const { Client } = require('pg');
const axios = require('axios');
const _=require('lodash');

const http = axios.create({
  baseURL: 'https://randomuser.me/api/',
});
const loadUsers = async () => {
  const { data: { results } } = await http.get('?results=100&seed=fmdbpg&page=9&nat=gb&inc=gender,name,email,dob');
  console.log(results);
  return results;

}








const config = {
  host: 'localhost',
  port: 5432,
  user: 'postgres',
  password: 'postgres',
  database: "fm_pg"
};

const mapUsers = (users) => {
  return users.map(
    ({ name: { first, last }, email, gender, dob: { date } }) => 
    `('${first}','${last}','${email}','${gender==='male'}','${date}','${_.random(0.5,2.4)}')`)
    .join(',');
}
const client = new Client(config);



start();
async function start() {
  await client.connect();
  const users = await loadUsers();
  const res = await client.query(`
INSERT INTO "users" ("firstName",
"lastName",
"email",
"isMale",
"birthday",
"height")

VALUES ${mapUsers(users)}
`);
  console.log(res);
  await client.end();
}

