import riot from "riot";
import * as RiotRouter from "riot-router";
import RiotControl from "riotcontrol";
import $ from "jquery";
import GithubStore from "./stores/githubStore.js";
import UserStore from "./stores/userStore.js";
import "./tags/app.tag";

const githubStore = new GithubStore();
const userStore = new UserStore();
RiotControl.addStore(userStore);
RiotControl.addStore(githubStore);

const Route = riot.router.Route;
const DefaultRoute = riot.router.DefaultRoute;


riot.router.routes([
  new DefaultRoute({tag: "login-screen"}),
  new Route({tag: "login-screen", path: "/auth", api: {authenticated: true}}),
  new Route({path: "/dashboard", tag: "dashboard"})
]);

riot.mount("app");

riot.router.start();
