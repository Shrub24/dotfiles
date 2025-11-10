/*!
 * BetTrackr Chrome Extension (c) 2025 BetTrackr Pty Ltd
 * Licensed for use with a valid BetTrackr account only.
 * Reverse engineering or modification is prohibited.
 */
import{getLatestVersionCached as t}from"../../shared.js";const e=chrome.runtime.getManifest().version;$("#currentVersion").text("v"+e);const r=await t();$("#latestVersion").text("v"+r);const o=`https://bettrackr.com.au/app.pma/get?OpenAction&resource=bettrackr_v${r}.zip`;$("#download-link").attr("href",o);