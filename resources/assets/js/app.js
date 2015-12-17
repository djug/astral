import riot from "riot";
import RiotControl from "riotcontrol";
import $ from "jquery";
import GithubStore from "./stores/githubStore.js";
import UserStore from "./stores/userStore.js";
import "./tags/app.tag";

const githubStore = new GithubStore();
const userStore = new UserStore();
RiotControl.addStore(userStore);
RiotControl.addStore(githubStore);


riot.mount("app");
riot.route.base("/");
riot.route.start(true);
