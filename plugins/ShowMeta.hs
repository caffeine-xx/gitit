module ShowMeta (plugin) where

-- This plugin replaces META with the metadata
import Network.Gitit.Interface

plugin :: Plugin
plugin = mkPageTransformM showmeta

showmeta :: Inline -> PluginM Inline
showmeta (Str x) | x == "META"  = do
  doNotCache  -- tell gitit not to cache this page, as it has dynamic content
  meta <- askMeta
  return $ Str $ show meta
showmeta x = return x
