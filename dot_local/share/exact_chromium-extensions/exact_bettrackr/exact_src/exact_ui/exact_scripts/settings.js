/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
import{logout as t,getUser as e}from"../../shared.js";export async function init(){const n=chrome.runtime.getManifest();$("#version").text(n.version);const o=document.getElementById("logoutButton");o&&o.addEventListener("click",(async function(){await t()}));const i=await e();$("#username").text(i.username)}