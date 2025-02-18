defmodule AshGraphql.Resource.Info do
  @moduledoc "Introspection helpers for AshGraphql.Resource"

  alias Spark.Dsl.Extension

  @doc "The queries exposed for the resource"
  def queries(resource) do
    Extension.get_entities(resource, [:graphql, :queries])
  end

  @doc "The mutations exposed for the resource"
  def mutations(resource) do
    Extension.get_entities(resource, [:graphql, :mutations]) || []
  end

  @doc "Wether or not to encode the primary key as a single `id` field when reading and getting"
  def encode_primary_key?(resource) do
    Extension.get_opt(resource, [:graphql], :encode_primary_key?, true)
  end

  @doc "The managed_relationship configurations"
  def managed_relationships(resource) do
    Extension.get_entities(resource, [:graphql, :managed_relationships]) || []
  end

  @doc "The graphql type of the resource"
  def type(resource) do
    Extension.get_opt(resource, [:graphql], :type, nil)
  end

  @doc "Wether or not to derive a filter input for the resource automatically"
  def derive_filter?(resource) do
    Extension.get_opt(resource, [:graphql], :derive_filter?, true)
  end

  @doc "Wether or not to derive a sort input for the resource automatically"
  def derive_sort?(resource) do
    Extension.get_opt(resource, [:graphql], :derive_sort?, true)
  end

  @doc "Graphql type overrides for the resource"
  def attribute_types(resource) do
    Extension.get_opt(resource, [:graphql], :attribute_types, [])
  end

  @doc "The field name to place the keyset of a result in"
  def keyset_field(resource) do
    Extension.get_opt(resource, [:graphql], :keyset_field, nil)
  end

  @doc "Graphql field name (attribute/relationship/calculation/arguments) overrides for the resource"
  def field_names(resource) do
    Extension.get_opt(resource, [:graphql], :field_names, [])
  end

  @doc "Which relationships should be included in the generated type"
  def relationships(resource) do
    Extension.get_opt(resource, [:graphql], :relationships, nil) ||
      resource |> Ash.Resource.Info.public_relationships() |> Enum.map(& &1.name)
  end

  @doc "Graphql argument name overrides for the resource"
  def argument_names(resource) do
    Extension.get_opt(resource, [:graphql], :argument_names, [])
  end

  @doc "Graphql type overrides for the resource"
  def attribute_input_types(resource) do
    Extension.get_opt(resource, [:graphql], :attribute_input_types, [])
  end

  @doc "The delimiter for a resource with a composite primary key"
  def primary_key_delimiter(resource) do
    Extension.get_opt(resource, [:graphql], :primary_key_delimiter, nil)
  end

  @doc "Wether or not an object should be generated, or if one with the type name for this resource should be used."
  def generate_object?(resource) do
    Extension.get_opt(resource, [:graphql], :generate_object?, nil)
  end
end
