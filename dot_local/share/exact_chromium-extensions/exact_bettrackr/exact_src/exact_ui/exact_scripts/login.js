/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
import{fetchToken as e,fetchUser as t,isLoggedIn as a,setUser as o}from"../../shared.js";export async function init(){const s=$("#loginForm"),n=$("#errorMessage");if(await a())return void(location.href="./layout.html?page=home");$("#header-nav").removeClass("d-flex").addClass("d-none");const r=chrome.runtime.getManifest();$("#version").text(r.version),$(s).on("submit",(async function(a){a.preventDefault(),n.text("");try{await async function(){const a=$("#username").val(),s=$("#password").val(),n=await e(a,s);if(!n.success)throw Error(n.error.message);{!async function(e){chrome.storage.local.set({bettrackrToken:e})}(n.token);const e=await t();o(e)}}(),location.href="./layout.html?page=home"}catch(e){n.text(e.message),n.addClass("d-block")}}))}