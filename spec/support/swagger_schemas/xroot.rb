# frozen_string_literal: true

# Xroot info
module SwaggerSchemas
  XROOT_INFO = {
    type: 'object',
    properties: {
      id: { type: 'string' },
      type: { type: 'string' },
      attributes: {
        type: 'object',
        properties: {
          title: { type: :string, nullable: true },
          synonym: { type: :string, nullable: true },
          description: { type: :string, nullable: true },
          code: { type: :string, nullable: true },
          version_date: { type: :date, nullable: true },
          publish: { type: :boolean, nullable: true }
        }
      }
    }
  }.freeze
end
