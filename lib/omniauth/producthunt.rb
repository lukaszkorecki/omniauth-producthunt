require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    # Producthunt oauth2 strategy
    class Producthunt < ::OmniAuth::Strategies::OAuth2
      option :name, 'producthunt'

      option :client_options,
             site: 'https://api.producthunt.com/v1/',
             authorize_url: 'https://api.producthunt.com/v1/oauth/authorize',
             token_url: 'https://api.producthunt.com/v1/oauth/token'

      uid { raw_info['user']['id'] }

      info do
        user_info = raw_info['user']
        {
          name: user_info['name'],
          username: user_info['username'],
          email: user_info['email'],
          avatar: user_info['image_url']['original']
        }
      end

      extra do
        { 'raw_info' => raw_info }
      end

      def authorize_params
        # for now override the scope here so that we can
        # call /v1/me and get current users information
        super.tap { |p| p[:scope] = 'public private' }
      end

      def callback_url
        # Fixes regression in omniauth-oauth2 v1.4.0 by https://github.com/intridea/omniauth-oauth2/commit/85fdbe117c2a4400d001a6368cc359d88f40abc7
        options[:callback_url] || (full_host + script_name + callback_path)
      end

      def raw_info
        @raw_info ||= access_token.get('me').parsed
      end
    end
  end
end
