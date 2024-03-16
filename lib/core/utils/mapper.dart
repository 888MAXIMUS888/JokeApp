abstract class Mapper<M, E> {
  E mapToEntity(M model);

  M mapFromEntity(E entity);
}