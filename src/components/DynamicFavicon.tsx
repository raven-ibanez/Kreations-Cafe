import React, { useEffect } from 'react';
import { useSiteSettingsContext } from '../contexts/SiteSettingsContext';

const DynamicFavicon: React.FC = () => {
  const { siteSettings } = useSiteSettingsContext();

  useEffect(() => {
    const updateFavicon = () => {
      const favicon = document.querySelector('link[rel="icon"]') as HTMLLinkElement;
      
      if (favicon && siteSettings?.site_logo) {
        // Create a new favicon link
        const newFavicon = document.createElement('link');
        newFavicon.rel = 'icon';
        newFavicon.type = 'image/jpeg';
        newFavicon.href = siteSettings.site_logo;
        
        // Remove the old favicon
        if (favicon.parentNode) {
          favicon.parentNode.removeChild(favicon);
        }
        
        // Add the new favicon
        document.head.appendChild(newFavicon);
      }
    };

    updateFavicon();
  }, [siteSettings?.site_logo]);

  // This component doesn't render anything
  return null;
};

export default DynamicFavicon;


