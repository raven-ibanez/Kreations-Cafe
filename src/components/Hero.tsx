import React from 'react';
import { useSiteSettingsContext } from '../contexts/SiteSettingsContext';

const Hero: React.FC = () => {
  const { siteSettings } = useSiteSettingsContext();
  
  return (
    <section className="relative bg-gradient-to-br from-coffee-cream to-coffee-beige py-20 px-4">
      <div className="max-w-4xl mx-auto text-center">
        <h1 className="text-5xl md:text-6xl font-noto-kr font-semibold text-coffee-dark mb-6 animate-fade-in">
          Artisan Coffee, Creative Creations
          <span className="block text-coffee-brown mt-2">{siteSettings?.site_name || "Kreations Cafe"}</span>
        </h1>
        <p className="text-xl text-gray-600 mb-8 max-w-2xl mx-auto animate-slide-up">
          Freshly roasted beans, handcrafted drinks, and delightful pastries made with love.
        </p>
        <div className="flex justify-center">
          <a 
            href="#menu"
            className="bg-coffee-brown text-white px-8 py-3 rounded-full hover:bg-coffee-espresso transition-all duration-300 transform hover:scale-105 font-medium"
          >
            Explore Menu
          </a>
        </div>
      </div>
    </section>
  );
};

export default Hero;